# from django.shortcuts import render
# from django.http import HttpResponseRedirect, HttpResponse, Http404
# from django.template import loader
# from django.shortcuts import get_object_or_404
# from django.urls import reverse
# 
# from .models import Aircraft,Seat
# 
# # Create your views here.
# def index(request):
#     aircraft_list = Aircraft.objects.order_by('-depart_time')[:5]
#     template = loader.get_template('AirSeatApp/index.html')
#     context = {
#         'aircraft_list': aircraft_list,
#     } 
#     return HttpResponse(template.render(context, request))
# 
# 같은 내용임.
#  def index(request):
#      aircraft_list = Aircraft.objects.order_by('-depart_time')[:5]
#      context = {'aircraft_list': aircraft_list}
#      return render(request, 'AirSeatApp/index.html', context)
  
# def detail(request, aircraft_id):
#     aircraft = get_object_or_404(Aircraft, pk=aircraft_id)
#     return render(request, 'AirSeatApp/detail.html', {'aircraft': aircraft})
  
# def detail(request, aircraft_id):
#     try:
#         aircraft = Aircraft.objects.get(pk=aircraft_id)
#     except Aircraft.DoesNotExist:
#         raise Http404("Question does not exist")
#     return render(request, 'AirSeatApp/detail.html', {'aircraft': aircraft})
   
# def results(request, aircraft_id):
#     aircraft = get_object_or_404(Aircraft, pk=aircraft_id)
#     return render(request, 'AirSeatApp/results.html', {'aircraft': aircraft})
#  
# def vote(request, aircraft_id):
#     aircraft = get_object_or_404(Aircraft, pk=aircraft_id)
#     try:
#         selected_seat = aircraft.seat_set.get(pk=request.POST['seat'])
#     except (KeyError, Seat.DoesNotExist):
#         # Redisplay the aircraft voting form.
#         return render(request, 'AirSeatApp/detail.html', {
#             'aircraft': aircraft,
#             'error_message': "You didn't select a choice.",
#         })
#     else:
#         selected_seat.reservatied = 1
#         selected_seat.save()
#         # Always return an HttpResponseRedirect after successfully dealing
#         # with POST data. This prevents data from being posted twice if a
#         # user hits the Back button.
#         return HttpResponseRedirect(reverse('AirSeatApp:results', args=(aircraft.id,)))


from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic

from .models import Airport, Seat


class IndexView(generic.ListView):
    template_name = 'AirSeatApp/index.html'
    context_object_name = 'aircraft_list'

    def get_queryset(self):
        """Return the last five published questions."""
        return Airport.objects.all()


class DetailView(generic.DetailView):
    model = Airport
    template_name = 'AirSeatApp/detail.html'


class ResultsView(generic.DetailView):
    model = Airport
    template_name = 'AirSeatApp/results.html'
  
def vote(request, aircraft_id):
    airport = get_object_or_404(Airport, pk=aircraft_id)
    try:
        selected_seat = airport.seat_set.get(pk=request.POST['seat'])
    except (KeyError, Seat.DoesNotExist):
        # Redisplay the airport voting form.
        return render(request, 'AirSeatApp/detail.html', {
            'airport': airport,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_seat.reservatied = 1
        selected_seat.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('AirSeatApp:results', args=(airport.id,)))
