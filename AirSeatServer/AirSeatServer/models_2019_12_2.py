# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Aircraft(models.Model):
    id_type = models.CharField(primary_key=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'aircraft'


class Airport(models.Model):
    location = models.CharField(primary_key=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'airport'


class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(unique=True, max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    name = models.CharField(max_length=255, blank=True, null=True)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    id = models.BigIntegerField(primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.NullBooleanField()
    username = models.CharField(unique=True, max_length=45)
    first_name = models.CharField(max_length=30, blank=True, null=True)
    last_name = models.CharField(max_length=30, blank=True, null=True)
    email = models.CharField(max_length=254, blank=True, null=True)
    is_staff = models.NullBooleanField()
    is_active = models.NullBooleanField()
    date_joined = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200, blank=True, null=True)
    action_flag = models.IntegerField()
    change_message = models.TextField(blank=True, null=True)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app_label = models.CharField(max_length=100, blank=True, null=True)
    model = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField(blank=True, null=True)
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class FlightSchedule(models.Model):
    id = models.FloatField(primary_key=True)
    id_aircraft = models.ForeignKey(Aircraft, models.DO_NOTHING, db_column='id_aircraft')
    depart_airport = models.ForeignKey(Airport, models.DO_NOTHING, db_column='depart_airport', related_name='FLIGHT_SCHEDULE_FK_AIRPORT1')
    arrive_airport = models.ForeignKey(Airport, models.DO_NOTHING, db_column='arrive_airport', related_name='FLIGHT_SCHEDULE_FK_AIRPORT2')
    depart_time = models.DateTimeField()
    arrive_time = models.DateTimeField()
    economy_price = models.FloatField()
    business_price = models.FloatField()

    class Meta:
        managed = False
        db_table = 'flight_schedule'


class Order(models.Model):
    id_seat = models.ForeignKey('Seat', models.DO_NOTHING, db_column='id_seat', primary_key=True)
    id_user = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='id_user')
    is_adult = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'order'


class Seat(models.Model):
    id = models.FloatField(primary_key=True)
    id_flight = models.ForeignKey(FlightSchedule, models.DO_NOTHING, db_column='id_flight')
    seat_col = models.CharField(max_length=1)
    seat_num = models.IntegerField()
    seat_grade = models.BooleanField()
    reservatied = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'seat'
