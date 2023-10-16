from django.contrib.auth import admin
from django.urls import path, include

from memorysafeapp import views

urlpatterns = [
    path('',views.home,name='home'),
    path('upload/', views.upload_image, name='upload_image'),
    path('delete_image/<str:pk>', views.delete_image, name='delete_image'),
]
