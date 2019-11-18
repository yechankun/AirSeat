from datetime import timedelta
import datetime

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

from bootstrap_datepicker_plus import DatePickerInput

from .models import Airport

class MainPage(forms.Form):
    select_round_or_one = forms.ChoiceField(choices=[("왕복","왕복"), ("편도","편도")], label="", 
                                            widget = forms.Select(attrs = {'onchange' : '$("#id_back_date").parent().parent().toggle();'}))
    seat_grade = forms.ChoiceField(choices=[("이코노미","이코노미"), ("비지니스","비지니스"), ("퍼스트", "퍼스트")], label="")
    select_is_adult = forms.ChoiceField(choices=[("성인","성인"), ("소아","소아"), ("유아", "유아")], label="")
    
    depart_list = Airport.objects.all().values_list('location')
    depart_list = [("", "선택")]+[(depart[0], depart[0]) for depart in depart_list]
    arrive_list = Airport.objects.all().values_list('location')
    arrive_list = [("", "선택")]+[(arrive[0], arrive[0]) for arrive in arrive_list]
    
    depart_airport = forms.ChoiceField(choices=depart_list, label="출발지")
    arrive_airport = forms.ChoiceField(choices=depart_list, label="도착지", initial='선택')    
    
    go_date = forms.DateField(label="가는 날", widget=DatePickerInput(options={"format": "MM/DD/YYYY", "locale": "ko"}))
    back_date = forms.DateField(label="오는 날", widget=DatePickerInput(options={"format": "MM/DD/YYYY", "locale": "ko"}), required=False)
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
    def clean_go_date(self):
        go_date = self.cleaned_data['go_date']
        
        if go_date < datetime.date.today():
            raise ValidationError(_('현재 날짜부터 선택할 수 있습니다'))
        # 범위 체크 (4주 안)
        if go_date > datetime.date.today() + datetime.timedelta(weeks=4):
            raise ValidationError(_('4주 이내만 선택할 수 있습니다'))

        # 데이터 반환
        return go_date
    
    def clean_back_date(self):
        select_round_or_one = self.cleaned_data.get('select_round_or_one')
        back_date = self.cleaned_data.get('back_date')
        go_date = self.cleaned_data.get('go_date')
        if back_date == None:
            if select_round_or_one == "편도":
                return back_date
            else:
                raise ValidationError(_('오는 날을 입력하셔야 합니다.'))
                
         
        if (back_date < go_date):
            raise ValidationError(_('오는 날이 과거일 수 없습니다.'))
        return back_date