"""AirSeatServer URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

from django.conf.urls import include, url
from django.contrib import admin

from . import views

urlpatterns = [
    url(r'^$', views.MainPageView.as_view(), name='index'),
    url(r'^choice/$', views.ChoicePageView.as_view(), name='choice'),
#     url(r'^test$', views.test, name='test'),
    url(r'^choice_seat/$', views.ChoiceSeatPageView.as_view(), name='choice_seat'),
    url(r'^payment/$', views.PaymentPageView.as_view(), name='payment'),
    url(r'^reservation_list/$', views.ReservationListView.as_view(), name='reservation_list'),
    url(r'^accounts/', include('accounts.urls')),
    url(r'^admin/', admin.site.urls)
]


