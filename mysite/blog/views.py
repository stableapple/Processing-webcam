from django.shortcuts import render
from blog.models import Blog
from django.shortcuts import  get_object_or_404
from django.views import generic
 
class index(generic.ListView):
    queryset = Blog.objects.filter(status=1).order_by('-created_on')
    template_name = 'index.html'

class view_post(generic.DetailView):
    model = Blog
    template_name = 'view_post.html'

 