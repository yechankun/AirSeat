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
from functools import reduce
import operator
from .widgets import  ChoiceSeatWidget,ChoiceCheckboxTableList


from bootstrap_datepicker_plus import DatePickerInput

from .models import Airport, Aircraft, FlightSchedule, Seat, AuthUser, Order

class MainPage(forms.Form):
    select_round_or_one = forms.ChoiceField(choices=[("왕복","왕복"), ("편도","편도")], label="", 
                                            widget = forms.Select(attrs = {'onchange' : '$("#id_back_date").parent().parent().toggle();'}))
    seat_grade = forms.ChoiceField(choices=[("이코노미","이코노미"), ("비지니스","비지니스")], label="")
    #select_is_adult = forms.ChoiceField(choices=[("성인","성인"), ("소아","소아"), ("유아", "유아")], label="")
    adult_count = forms.IntegerField(label="성인 수", initial=1)
    youth_count = forms.IntegerField(label="소아 수", initial=0)
    baby_count  = forms.IntegerField(label="유아 수", initial=0)
    
    depart_list = Airport.objects.all().values_list('location')
    depart_list = [("", "선택")]+[(depart[0], depart[0]) for depart in depart_list]
    arrive_list = Airport.objects.all().values_list('location')
    arrive_list = [("", "선택")]+[(arrive[0], arrive[0]) for arrive in arrive_list]
    
    depart_airport = forms.ChoiceField(choices=depart_list, label="출발지")
    arrive_airport = forms.ChoiceField(choices=depart_list, label="도착지", initial='선택')    
    
    go_date = forms.DateField(label="가는 날", widget=DatePickerInput(options={"format": "YYYY/MM/DD", "locale": "ko"}), input_formats=['%Y/%m/%d'])
    back_date = forms.DateField(label="오는 날", widget=DatePickerInput(options={"format": "YYYY/MM/DD", "locale": "ko"}), required=False, input_formats=['%Y/%m/%d'])
    
#     def __init__(self, *args, **kwargs):
#         super().__init__(*args, **kwargs)
    def clean(self):
        cleaned_data  = super().clean()
        adult_count = cleaned_data.get('adult_count')
        youth_count = cleaned_data.get('youth_count')
        baby_count = cleaned_data.get('baby_count')
        
        if(adult_count == None or adult_count == 0):
            raise ValidationError(_('성인이 0명일 수 없습니다.'))
            if(adult_count<0):
                raise ValidationError(_('0명 이하일 수 없습니다.'))
        
        if(youth_count < 0 or baby_count < 0):
            raise ValidationError(_('0명 이하일 수 없습니다.'))
        
        
        
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
        if go_date == None:
            raise ValidationError(_(''))
                
        
        if (back_date < go_date):
            raise ValidationError(_('오는 날이 과거일 수 없습니다.'))
        return back_date


class ChoicePage(forms.Form):
    #이걸 나중에 써야됨.
    
    
    def __init__(self, *args, **kwargs):
        self.select_round_or_one = kwargs.pop('select_round_or_one',None)      
        self.seat_grade = kwargs.pop('seat_grade',None)
        self.adult_count = kwargs.pop('adult_count',None)
        self.youth_count = kwargs.pop('youth_count',None)
        self.baby_count = kwargs.pop('baby_count',None)
        self.depart_airport = kwargs.pop('depart_airport',None)
        self.arrive_airport = kwargs.pop('arrive_airport',None)
        self.go_date = kwargs.pop('go_date',None)
        self.back_date = kwargs.pop('back_date',None)
        super(ChoicePage, self).__init__(*args, **kwargs)
        #테스트용이니 남겨놓기
        #self.fields['show_temp']  = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'style': 'width: 100%', 'placeholder': str(type(self.arrive_airport))}))
#         aircraft_list = Aircraft.objects.all().values_list('id_type')
#         aircraft_list = [(aircraft[0], aircraft[0]) for aircraft in aircraft_list]
#                                    
#         self.fields['select_round_or_one'] = forms.ChoiceField(choices=[("왕복","왕복"), ("편도","편도")], label="", 
#                                             widget = forms.Select(attrs = {'mode' : '0', 'onchange' : '$("#id_back_date").parent().parent().toggle(); this.form.mode="1" this.form.submit();'}))
#         self.fields['seat_grade'] = forms.ChoiceField(choices=[("이코노미","이코노미"), ("비지니스","비지니스")], label="")
#         #select_is_adult = forms.ChoiceField(choices=[("성인","성인"), ("소아","소아"), ("유아", "유아")], label="")
#         self.fields['adult_count'] = forms.IntegerField(label="성인 수", initial=1)
#         self.fields['youth_count'] = forms.IntegerField(label="소아 수", initial=0)
#         self.fields['baby_count']  = forms.IntegerField(label="유아 수", initial=0)
#         
#         depart_list = Airport.objects.all().values_list('location')
#         depart_list = [("", "선택")]+[(depart[0], depart[0]) for depart in depart_list]
#         arrive_list = Airport.objects.all().values_list('location')
#         arrive_list = [("", "선택")]+[(arrive[0], arrive[0]) for arrive in arrive_list]
#         
#         self.fields['depart_airport'] = forms.ChoiceField(choices=depart_list, label="출발지")
#         self.fields['arrive_airport'] = forms.ChoiceField(choices=depart_list, label="도착지", initial='선택')    
#         
#         self.fields['go_date'] = forms.DateField(label="가는 날", widget=DatePickerInput(options={"format": "MM/DD/YYYY", "locale": "ko"}))
#         self.fields['back_date'] = forms.DateField(label="오는 날", widget=DatePickerInput(options={"format": "MM/DD/YYYY", "locale": "ko"}), required=False)
#         
        self.fields['choice_aircraft'] = forms.ChoiceField(choices=self.get_list(0), initial=0, label="가는 편", widget = forms.Select(attrs={'size':'10'}))
        if(self.select_round_or_one == '왕복'):
            self.fields['choice_aircraft2'] = forms.ChoiceField(choices=self.get_list(1) , initial=0, label="오는 편", widget = forms.Select(attrs={'size':'10'}))
            
    def get_list(self, mode):
        if(mode==0):
            temp_date=self.go_date.split('.')
            depart = self.depart_airport
            arrive = self.arrive_airport
        else:
            temp_date=self.back_date.split('.')
            depart = self.arrive_airport
            arrive = self.depart_airport
        def_query = FlightSchedule.objects.filter(depart_time__year=temp_date[0],
                              depart_time__month=temp_date[1],
                              depart_time__day=temp_date[2],
                              depart_airport=depart,
                              arrive_airport=arrive).order_by('depart_time')
        
        
        id_list = def_query.values_list('id', flat=True)
        id_aircraft_list = def_query.values_list('id_aircraft', flat=True)
        
        if(self.seat_grade=='이코노미'):
            price_list = def_query.values_list('economy_price', flat=True)
        else:
            price_list = def_query.values_list('business_price', flat=True)
        
        #qs = qs.extra(select={'datestr':"DATE_FORMAT(activation_date, '%Y-%m-%d')"})
        
        depart_time_list = def_query.values_list('depart_time', flat=True)
        arrive_time_list = def_query.values_list('arrive_time', flat=True)
        
        #result__list = [(aircraft, aircraft) for price in price_list for aircraft in temp_list]
        
        result__list = []
        for num in range(0, len(id_list)):
            result__list.append((id_list[num], "항공기:{0}　　　출발시간:{1}　　　도착시간:{2}　　　가격:{3}"
                                 .format(id_aircraft_list[num], 
                                         depart_time_list[num].strftime('%Y/%m/%d/%H:%M:%S'),
                                         arrive_time_list[num].strftime('%Y/%m/%d/%H:%M:%S'), 
                                         price_list[num])))
                    
        #self.dsalkfj
        return result__list
        #Seat.objects.filter(Q(reduce(operator.and_, (Q(id_aircraft=x) for x in temp_list))) & Q(reservatied='0')).
                            
        #User.objects.filter(reduce(operator.and_, (Q(first_name__contains=x) for x in ['x', 'y', 'z']))
        

class ChoiceSeatPage(forms.Form):
    def __init__(self, *args, **kwargs):
        self.select_round_or_one = kwargs.pop('select_round_or_one',None)      
        self.seat_grade = kwargs.pop('seat_grade',None)
        self.adult_count = kwargs.pop('adult_count',None)
        self.youth_count = kwargs.pop('youth_count',None)
        self.baby_count = kwargs.pop('baby_count',None)
        self.depart_airport = kwargs.pop('depart_airport',None)
        self.arrive_airport = kwargs.pop('arrive_airport',None)
        self.go_date = kwargs.pop('go_date',None)
        self.back_date = kwargs.pop('back_date',None)
        self.choice_aircraft = kwargs.pop('choice_aircraft',None)
        self.choice_aircraft2 = kwargs.pop('choice_aircraft2',None)
        super(ChoiceSeatPage, self).__init__(*args, **kwargs)
        grade_dict = {'이코노미':0, '비지니스':1}
        list_query1 = Seat.objects.filter(id_flight=self.choice_aircraft, seat_grade=grade_dict[self.seat_grade]).order_by('id')

        #id_list = [(id, id) for id in list_query1.values_list('id', flat=True)]
        id_list = list_query1.values_list('id', 'seat_col', 'seat_num')
        id_list = [(idd, seat_col_list+str(seat_num_list)) for (idd, seat_col_list, seat_num_list) in id_list]
        
        disable_list = list_query1.values_list('reservatied', flat=True)
        seat_col_list = list_query1.order_by('seat_col').values_list('seat_col', flat=True).distinct()
        seat_num_list = list_query1.order_by('seat_num').values_list('seat_num', flat=True).distinct()
        
        self.fields['choice_seat'] = forms.MultipleChoiceField(
            choices=id_list, 
            widget=ChoiceSeatWidget(
                disable_list=disable_list,
                col_list=seat_col_list, 
                num_list=seat_num_list, 
                columns=len(seat_num_list),
                )
            , label="가는편 좌석 선택")
        if(self.select_round_or_one == '왕복'):
            list_query2 = Seat.objects.filter(id_flight=self.choice_aircraft2, seat_grade=grade_dict[self.seat_grade]).order_by('id')
            
            disable_list2 = list_query2.values_list('reservatied', flat=True)
            id_list2 = list_query2.values_list('id', 'seat_col', 'seat_num')
            id_list2 = [(idd, seat_col_list+str(seat_num_list)) for (idd, seat_col_list, seat_num_list) in id_list2]
            seat_col_list2 = list_query2.order_by('seat_col').values_list('seat_col', flat=True).distinct()
            seat_num_list2 = list_query2.order_by('seat_num').values_list('seat_num', flat=True).distinct()
            
            self.fields['choice_seat2'] = forms.MultipleChoiceField(
                choices=id_list2,
                widget=ChoiceSeatWidget(
                    disable_list=disable_list2,
                    col_list=seat_col_list2, 
                    num_list=seat_num_list2, 
                    columns=len(seat_num_list2), 
                    )
                , label="오는편 좌석 선택")
            
    def clean_choice_seat(self):
        choice_seat = self.cleaned_data['choice_seat']
        
        if len(choice_seat) != self.adult_count+self.youth_count+self.baby_count:
            raise ValidationError(_('사람 수와 동일하게 선택해야 합니다.'))
        # 데이터 반환
        return choice_seat
    
    def clean_choice_seat2(self):
        choice_seat = self.cleaned_data['choice_seat2']
        
        if len(choice_seat) != self.adult_count+self.youth_count+self.baby_count:
            raise ValidationError(_('사람 수와 동일하게 선택해야 합니다.'))
        # 데이터 반환
        return choice_seat       
            
class PaymentPage(forms.Form):
    card_number = forms.CharField(
        widget=forms.TextInput(attrs={'placeholder':'0000 0000 0000 0000'}), 
        min_length=12,
        max_length=19,
        label="",
         )
    card_expiry = forms.CharField(
        widget=forms.TextInput(attrs={'placeholder':'MM/YY'}), 
        min_length=5,
        max_length=5,
        label="",
         )
    card_security = forms.CharField(
        widget=forms.PasswordInput(attrs={'placeholder':'CVV/CVC'}), 
        min_length=3,
        max_length=3,
        label="",
         )
    
    def __init__(self, *args, **kwargs):
        super(PaymentPage, self).__init__(*args, **kwargs)
        
class ReservationList(forms.Form):
    def __init__(self, *args, **kwargs):
        self.user_id = kwargs.pop('user_id',None)
        super(ReservationList, self).__init__(*args, **kwargs)
        
        user = AuthUser.objects.get(id=self.user_id)
        order = Order.objects.filter(id_user=user)
        
        order_seat_list = order.values_list(
                                            'id_seat',
                                            'is_adult',
                                            'price',
                                            'id_seat__id_flight__id_aircraft__id_type',
                                            'id_seat__seat_col',
                                            'id_seat__seat_num',
                                            'id_seat__seat_grade',
                                            'id_seat__id_flight__depart_airport',
                                            'id_seat__id_flight__arrive_airport',
                                            'id_seat__id_flight__depart_time',
                                            'id_seat__id_flight__arrive_time'
                                            )
        order_seat_id_list=[(id_seat, id_seat) for (id_seat,  *args) in order_seat_list]
        #배열 정제. 보여줄 필드 순서.
        order_seat_status_list=[[id_type, seat_col+str(seat_num), 
                                 '비지니스' if grade else '이코노미' , 
                                 *args, 
                                 '성인' if is_adult==0 else '소아' if is_adult==1 else '유아',
                                  '￦'+str(price)] for (
                                            id_seat, 
                                            is_adult, 
                                            price,
                                            id_type, seat_col, seat_num, 
                                            grade,
                                            *args) in order_seat_list]
        th_list = ['항공편',
                   '좌석',
                   '좌석 등급',
                   '출발지',
                   '도착지',
                   '출발 시간',
                   '도착 시간',
                   '분류',
                   '가격']
        
        self.fields['choice_seat'] = forms.MultipleChoiceField(
            choices=order_seat_id_list, 
            widget=ChoiceCheckboxTableList(
                tr_list=order_seat_status_list,
                th_list=th_list,
                )
            , label="예약 목록")
    

#참고용 쓸모없는 쿼리들    
#         order_adult_list = order.values_list('is_adult',flat=True)
#         
#         seat_query = Seat.objects.filter(pk__in=order_seat_list)
#         seat_status_list = seat_query.values_list('id', 'seat_num')
#         seat_flight_id_list = seat_query.values_list('id_flight',flat=True)
#          
#         flight_status_list = FlightSchedule.objects