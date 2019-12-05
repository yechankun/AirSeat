from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.conf import settings
import os
from django.views.generic import View, FormView
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages
from django.utils.translation import gettext_lazy as _

from .models import FlightSchedule, Seat, Order, AuthUser
from .forms import MainPage, ChoicePage, ChoiceSeatPage, PaymentPage, ReservationList
import itertools
from django.views.generic.list import ListView



class MainPageView(FormView):
    template_name = 'main/index.html'
    form_class = MainPage


    def form_valid(self, form):
        request = self.request
        request.session['select_round_or_one']=form.cleaned_data['select_round_or_one']
        request.session['seat_grade']=form.cleaned_data['seat_grade']
        request.session['adult_count']=form.cleaned_data['adult_count']
        request.session['youth_count']=form.cleaned_data['youth_count']
        request.session['baby_count']=form.cleaned_data['baby_count']
        request.session['depart_airport']=form.cleaned_data['depart_airport']
        request.session['arrive_airport']=form.cleaned_data['arrive_airport']
        request.session['go_date']=form.cleaned_data['go_date'].strftime('%Y.%m.%d')
        if(request.session['select_round_or_one'] == '왕복'):
            request.session['back_date']=form.cleaned_data['back_date'].strftime('%Y.%m.%d')
     
        return redirect('choice')
    
    
class ChoicePageView(FormView):
    template_name = 'main/choice.html'
    form_class = ChoicePage
    
    def get_form_kwargs(self):
        request = self.request
        kwargs = super(ChoicePageView, self).get_form_kwargs()
        kwargs['select_round_or_one'] = request.session['select_round_or_one']
        kwargs['seat_grade'] = request.session['seat_grade']
        kwargs['adult_count'] = request.session['adult_count']
        kwargs['youth_count'] = request.session['youth_count']
        kwargs['baby_count'] = request.session['baby_count']
        kwargs['depart_airport'] = request.session['depart_airport']
        kwargs['arrive_airport'] = request.session['arrive_airport']
        kwargs['go_date'] = request.session['go_date']
        if(request.session['select_round_or_one'] == '왕복'):
            kwargs['back_date'] = request.session['back_date']
        
        return kwargs
    
    def form_valid(self, form):
        """Return the last five published questions."""
        request = self.request
        request.session['choice_aircraft']=form.cleaned_data['choice_aircraft']
        request.session['go_depart_time'] = FlightSchedule.objects.get(
            id=request.session['choice_aircraft']).depart_time.strftime('%Y{0}%m{1} %d{2} %H{3} %M{4} %S{5}').format(*'년월일시분초')
        if(request.session['select_round_or_one'] == '왕복'):
            request.session['choice_aircraft2']=form.cleaned_data['choice_aircraft2']
            request.session['back_depart_time'] = FlightSchedule.objects.get(
                id=request.session['choice_aircraft2']).depart_time.strftime('%Y{0}%m{1} %d{2} %H{3} %M{4} %S{5}').format(*'년월일시분초')
        
        return redirect('choice_seat')
    
    def get_context_data(self, **kwargs):
        data = super(ChoicePageView, self).get_context_data(**kwargs)
        
        airport_dict = {'인천':'ICN', '김포':'GMP','부산(김해)':'PUS','대구':'TAE','청주':'CJJ','제주':'CJU', '무안':'MWX','울산':'USN','광주':'KWJ','여수':'RSU','군산':'KUV'}
        
        if(airport_dict.get(self.request.session['depart_airport'], 0) != 0 
           and airport_dict.get(self.request.session['arrive_airport'], 0) != 0):
            base_url = 'https://flight.naver.com/flights/results/domestic?'
            
            trip = {'편도':'OW', '왕복':'RT'}
            
            result_url = base_url + 'trip={0}&scity1={1}&ecity1={2}&'.format(
                trip[self.request.session['select_round_or_one']],
                airport_dict[self.request.session['depart_airport']],
                airport_dict[self.request.session['arrive_airport']])        
            result_url += 'adult={0}&child={1}&infant={2}&sdate1={3}&'.format(
                self.request.session['adult_count'],
                self.request.session['youth_count'],
                self.request.session['baby_count'],
                self.request.session['go_date'])
            
            if(self.request.session['select_round_or_one'] == '왕복'):
                result_url += 'scity2={0}&ecity2={1}&sdate2={2}'.format(
                    airport_dict[self.request.session['arrive_airport']],
                    airport_dict[self.request.session['depart_airport']],
                    self.request.session['back_date'])
        
        data['naver_url'] = result_url

        return data
    
class ChoiceSeatPageView(FormView):
    template_name = 'main/choice_seat.html'
    form_class = ChoiceSeatPage
    
    def form_valid(self, form):
        request = self.request
        
        request.session['choice_seat']=form.cleaned_data['choice_seat']
        if(self.request.session['select_round_or_one'] == '왕복'):
            request.session['choice_seat2']=form.cleaned_data['choice_seat2']
        
        """Return the last five published questions."""
        return redirect('payment')
    def get_form_kwargs(self):
        request = self.request
        kwargs = super(ChoiceSeatPageView, self).get_form_kwargs()
        kwargs['select_round_or_one'] = request.session['select_round_or_one']
        kwargs['seat_grade'] = request.session['seat_grade']
        kwargs['adult_count'] = request.session['adult_count']
        kwargs['youth_count'] = request.session['youth_count']
        kwargs['baby_count'] = request.session['baby_count']
        kwargs['depart_airport'] = request.session['depart_airport']
        kwargs['arrive_airport'] = request.session['arrive_airport']
        kwargs['go_date'] = request.session['go_date']            
        kwargs['choice_aircraft'] = request.session['choice_aircraft']
        if(request.session['select_round_or_one'] == '왕복'):
            kwargs['choice_aircraft2'] = request.session['choice_aircraft2']
            kwargs['back_date'] = request.session['back_date']
    
        return kwargs
    
    def get_context_data(self, **kwargs):
        data = super(ChoiceSeatPageView, self).get_context_data(**kwargs)
        request = self.request
        data['select_round_or_one'] = request.session['select_round_or_one']
        data['seat_grade'] = request.session['seat_grade']
        data['adult_count'] = request.session['adult_count']
        data['youth_count'] = request.session['youth_count']
        data['baby_count'] = request.session['baby_count']
        data['depart_airport'] = request.session['depart_airport']
        data['arrive_airport'] = request.session['arrive_airport']
        data['go_depart_time'] = request.session['go_depart_time']            
        data['choice_aircraft_id'] = request.session['choice_aircraft_id'] = FlightSchedule.objects.get(
            id=request.session['choice_aircraft']).id_aircraft.id_type
        if(request.session['select_round_or_one'] == '왕복'):
            data['choice_aircraft_id2'] = request.session['choice_aircraft_id2'] = FlightSchedule.objects.get(
                id=request.session['choice_aircraft2']).id_aircraft.id_type
            data['back_depart_time'] = request.session['back_depart_time']
            
        return data
    
class PaymentPageView(FormView):
    template_name = 'main/payment.html'
    form_class = PaymentPage        
        
    def form_valid(self, form, **kwargs):
        request = self.request
        
        if not request.user.is_authenticated:
            request.session['session_temp'] = True
            return redirect(settings.LOGIN_URL)
        adult_count = adult_count2 = request.session['adult_count']
        youth_count = youth_count2 = request.session['youth_count']
        #baby_count = request.session['baby_count']
        data = self.get_context_data(**kwargs)
        go_adult_price = data['go_adult_price']
        go_youth_price = data['go_youth_price']
        go_baby_price  = data['go_baby_price']
        back_adult_price = data['back_adult_price']
        back_youth_price = data['back_youth_price']
        back_baby_price  = data['back_baby_price']
        
        #DB에 저장
        query = Seat.objects.filter(pk__in=request.session['choice_seat'])
        user = AuthUser.objects.get(id=request.user.id)
        for val in query:
            if adult_count>0:
                order = Order.objects.create(id_seat=val , id_user=user , is_adult=0, price=go_adult_price)
                adult_count -= 1
            elif youth_count>0:
                order = Order.objects.create(id_seat=val , id_user=user , is_adult=1, price=go_youth_price)
                youth_count -= 1
            else:
                order = Order.objects.create(id_seat=val , id_user=user , is_adult=2, price=go_baby_price)
            
            order.save()
            val.reservatied=1
            val.save()
        
        #왕복일경우 오는편 예약 DB에 저장
        if(request.session['select_round_or_one'] == '왕복'):
            query2 = Seat.objects.filter(pk__in=request.session['choice_seat2'])
            for val in query2:
                if adult_count2>0:
                    order = Order.objects.create(id_seat=val , id_user=user , is_adult=0, price=back_adult_price)
                    adult_count2 -= 1
                elif youth_count2>0:
                    order = Order.objects.create(id_seat=val , id_user=user , is_adult=1, price=back_youth_price)
                    youth_count2 -= 1
                else:
                    order = Order.objects.create(id_seat=val , id_user=user , is_adult=2, price=back_baby_price)
                
                order.save()
                val.reservatied=1
                val.save()
        request.session['select_round_or_one'] = None
        request.session['seat_grade'] = None
        request.session['adult_count'] = None
        request.session['youth_count'] = None
        request.session['baby_count'] = None
        request.session['depart_airport'] = None
        request.session['arrive_airport'] = None
        request.session['go_date'] = None
        request.session['back_date'] = None
        request.session['choice_aircraft'] = None
        request.session['go_depart_time'] = None
        request.session['choice_aircraft2'] = None
        request.session['back_depart_time'] = None
        request.session['choice_seat'] = None
        request.session['choice_seat2'] = None
        request.session['session_temp'] = None
        
        return redirect('index')
    
    def get_context_data(self, **kwargs):
        data = super(PaymentPageView, self).get_context_data(**kwargs)
        request = self.request
        
        data['select_round_or_one'] = request.session['select_round_or_one']
        data['seat_grade'] = request.session['seat_grade']
        data['adult_count'] = request.session['adult_count']
        data['youth_count'] = request.session['youth_count']
        data['baby_count'] = request.session['baby_count']
        data['depart_airport'] = request.session['depart_airport']
        data['arrive_airport'] = request.session['arrive_airport']
        data['go_depart_time'] = request.session['go_depart_time']            
        data['choice_aircraft_id'] = request.session['choice_aircraft_id']
            
        data['choice_seat'] = request.session['choice_seat']
        choice_seat_list = Seat.objects.filter(
            pk__in=data['choice_seat']).values_list('seat_col', 'seat_num')
        data['choice_seat_col_num'] = [
            seat_col_list+"열 "+str(seat_num_list)+"번" for (seat_col_list, seat_num_list) in choice_seat_list
            ]
        go_sum_price=0
        back_sum_price=0        
        
        
        grade_dict = {'이코노미':'economy_price', '비지니스':'business_price'}
        go_price= FlightSchedule.objects.get(id=request.session['choice_aircraft']).__dict__[grade_dict[request.session['seat_grade']]]
        
        go_adult_price = go_price
        go_youth_price = int(go_adult_price * 0.5)
        go_baby_price = 0
        
        back_price= FlightSchedule.objects.get(id=request.session['choice_aircraft2']).__dict__[grade_dict[request.session['seat_grade']]]
        back_adult_price = back_price
        back_youth_price = int(back_adult_price * 0.5)
        back_baby_price = 0
        
        data['go_adult_price'] = go_adult_price
        data['go_youth_price'] = go_youth_price
        data['go_baby_price'] = go_baby_price
        
        go_sum_price = data['adult_count'] * go_adult_price + \
                        data['youth_count'] * go_youth_price + \
                        data['baby_count'] * go_baby_price
        
        #왕복일 경우
        if(data['select_round_or_one'] == '왕복'):
            data['choice_seat2'] = request.session['choice_seat2']
            choice_seat_list2 = Seat.objects.filter(
                pk__in=data['choice_seat2']).values_list('seat_col', 'seat_num')
            data['choice_seat_col_num2'] = [
                seat_col_list+"열 "+str(seat_num_list)+"번" for (seat_col_list, seat_num_list) in choice_seat_list2
                ]
            data['back_depart_time'] = request.session['back_depart_time']
            data['choice_aircraft_id2'] = request.session['choice_aircraft_id2']

            data['back_adult_price'] = back_adult_price
            data['back_youth_price'] = back_youth_price
            data['back_baby_price'] = back_baby_price
            
            back_sum_price = data['adult_count'] * back_adult_price + \
                        data['youth_count'] * back_youth_price + \
                        data['baby_count'] * back_baby_price
            

        result_price = go_sum_price + back_sum_price
        data['result_price'] = result_price
         
        return data
    
class ReservationListView(FormView):
    template_name = 'main/reservation_list.html'
    form_class = ReservationList
    
    def form_valid(self, form):
        id_list = form.cleaned_data['choice_seat']
        order = Order.objects.filter(pk__in=id_list)
        seat = Seat.objects.filter(pk__in=id_list)
        order.delete()
        seat.update(reservatied='0')
        return redirect('reservation_list')
    def get_form_kwargs(self):
        request = self.request
        kwargs = super(ReservationListView, self).get_form_kwargs()
        kwargs['user_id'] = request.user.id  
        return kwargs