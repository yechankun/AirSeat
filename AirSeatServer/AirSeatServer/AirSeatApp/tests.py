import datetime

from django.utils import timezone
from django.test import TestCase

from .models import Aircraft


class AircraftModelTests(TestCase):

    def test_was_published_recently_with_future_question(self):
        """
        was_published_recently() returns False for questions whose depart_time
        is in the future.
        """
        time = timezone.now() + datetime.timedelta(days=30)
        future_question = Aircraft(depart_time=time)
        self.assertIs(future_question.was_published_recently(), False)