from django.conf.urls import url

from . import views    

app_name = 'accounts'
urlpatterns = [
    
    url(r'^log-in/$', views.LogInView.as_view(), name='log_in'),
    url(r'^log-out/$', views.LogOutView.as_view(), name='log_out'),
    url(r'^sign-up/$', views.SignUpView.as_view(), name='sign_up'),
    url(r'^activate/?P<code>/$', views.ActivateView.as_view(), name='activate'),
    url(r'^change/profile/$', views.ChangeProfileView.as_view(), name='change_profile'),
]
