from django.contrib import admin

# Register your models here.
from django.contrib import admin

from .models import Aircraft, Airport, AuthUser, FlightSchedule, Order, Seat 

admin.site.register(Aircraft)
admin.site.register(Airport)
admin.site.register(AuthUser)
admin.site.register(FlightSchedule)
admin.site.register(Order)
admin.site.register(Seat)



