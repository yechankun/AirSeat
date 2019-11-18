from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.conf import settings
import os
from django.views.generic import View, FormView
from django.shortcuts import get_object_or_404, redirect

from .models import Aircraft
from .forms import MainPage
import itertools


class MainPageView(FormView):
    template_name = 'main/index.html'
    form_class = MainPage


    def form_valid(self, form):
        request = self.request
     
        return redirect('index')