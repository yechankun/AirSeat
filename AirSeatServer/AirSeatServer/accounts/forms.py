from datetime import timedelta

from django import forms
from django.forms import ValidationError
from django.conf import settings
from django.contrib.auth import  password_validation
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, UsernameField
from django.utils import timezone
from django.db.models import Q
from django.utils.translation import gettext_lazy as _
from distributed.core import error_message


class UserCacheMixin:
    user_cache = None


class SignIn(UserCacheMixin, forms.Form):
    password = forms.CharField(label=_('비밀번호'), strip=False, widget=forms.PasswordInput)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        if settings.USE_REMEMBER_ME:
            self.fields['remember_me'] = forms.BooleanField(label=_('Remember me'), required=False)

    def clean_password(self):
        password = self.cleaned_data['password']

        if not self.user_cache:
            return password

        if not self.user_cache.check_password(password):
            raise ValidationError(_('비밀번호가 틀렸습니다.'))

        return password


class SignInViaUsernameForm(SignIn):
    username = forms.CharField(label=_('아이디'))

    @property
    def field_order(self):
        if settings.USE_REMEMBER_ME:
            return ['username', 'password', 'remember_me']
        return ['username', 'password']

    def clean_username(self):
        username = self.cleaned_data['username']

        user = User.objects.filter(username=username).first()
        if not user:
            raise ValidationError(_('You entered an invalid username.'))

        if not user.is_active:
            raise ValidationError(_('This account is not active.'))

        self.user_cache = user

        return username


class SignInViaEmailForm(SignIn):
    email = forms.EmailField(label=_('Email'))

    @property
    def field_order(self):
        if settings.USE_REMEMBER_ME:
            return ['email', 'password', 'remember_me']
        return ['email', 'password']

    def clean_email(self):
        email = self.cleaned_data['email']

        user = User.objects.filter(email__iexact=email).first()
        if not user:
            raise ValidationError(_('You entered an invalid email address.'))

        if not user.is_active:
            raise ValidationError(_('This account is not active.'))

        self.user_cache = user

        return email


class SignInViaEmailOrUsernameForm(SignIn):
    email_or_username = forms.CharField(label=_('아이디 또는 이메일'))
 
    @property
    def field_order(self):
        return ['email_or_username', 'password']

    def clean_email_or_username(self):
        email_or_username = self.cleaned_data['email_or_username']

        user = User.objects.filter(Q(username=email_or_username) | Q(email__iexact=email_or_username)).first()
        if not user:
            raise ValidationError(_('유효하지 않은 계정입니다.'))

        if not user.is_active:
            raise ValidationError(_('이 계정은 비활성화 상태입니다. 관리자에게 문의하십시오.'))

        self.user_cache = user

        return email_or_username


class SignUpForm(UserCreationForm):
    error_messages = {
        'password_mismatch' : _('패스워드가 다릅니다. 다시 입력해주세요.'),
    }
    class Meta:
        model = User
        fields = settings.SIGN_UP_FIELDS
        
    username = forms.CharField(label=_('계정명'), max_length=30)
    first_name = forms.CharField(label=_('성'), max_length=30)
    last_name = forms.CharField(label=_('이름'), max_length=150, required=False)
    email = forms.EmailField(label=_('이메일'))
    password1 = forms.CharField(label=_('패스워드'), max_length=150, widget=forms.PasswordInput)
    password2 = forms.CharField(label=_('패스워드 재입력'), max_length=150, widget=forms.PasswordInput)
    def clean_email(self):
        email = self.cleaned_data['email']

        user = User.objects.filter(email__iexact=email).exists()
        if user:
            raise ValidationError(_('해당 이메일은 이미 사용중입니다.'))

        return email

class ChangeProfileForm(forms.ModelForm):
    first_name = forms.CharField(label=_('성'), max_length=30, required=False)
    last_name = forms.CharField(label=_('이름'), max_length=150, required=False)
    email = forms.EmailField(label=_('Email'), max_length=254)
    password1 = forms.CharField(label=_('패스워드'), max_length=150, widget=forms.PasswordInput)
    password2 = forms.CharField(label=_('패스워드 재입력'), max_length=150, widget=forms.PasswordInput)
    error_messages = {
        'password_mismatch' : _('패스워드가 다릅니다. 다시 입력해주세요.'),
    }
    class Meta:
        model = User
        fields = ("first_name", "last_name", "email",)
        field_classes = {'username': UsernameField}
    
    def __init__(self, user, *args, **kwargs):
        self.user = user
        super(ChangeProfileForm, self).__init__(*args, **kwargs)
        f = self.fields.get('user_permissions')
        if f is not None:
            f.queryset = f.queryset.select_related('content_type')
            
    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(
                self.error_messages['password_mismatch'],
                code='password_mismatch',
            )
        self.instance.username = self.cleaned_data.get('username')
        password_validation.validate_password(self.cleaned_data.get('password2'), self.instance)
        return password2
    
    def clean_email(self):
        email = self.cleaned_data['email']
        
        if email != self.user.email:
            user = User.objects.filter(Q(email__iexact=email) & ~Q(id=self.user.id)).exists()
            if user:
                raise ValidationError(_('해당 이메일은 이미 사용중입니다.'))

        return email
    