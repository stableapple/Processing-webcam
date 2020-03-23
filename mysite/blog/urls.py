from . import views
from django.urls import path

urlpatterns = [
    path('', views.index.as_view(), name='home'),
    path('<slug:slug>/', views.view_post.as_view(), name='view_post'),
]
