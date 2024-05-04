from django.urls import path
from . import views

app_name = 'authentication'

urlpatterns = [
    path('index/', views.index, name='index'),
    path('signin/', views.signin, name='signin'),
    path('signout/', views.signout, name='signout'),
]