from django.db import models
from django.contrib.auth.models import User

STATUS = (
    (0,"Draft"),
    (1,"Publish")
)
class Blog(models.Model):
   title = models.CharField(max_length=100, unique=True)
   slug = models.SlugField(max_length=100, unique=True)
   body = models.TextField()
   updated_on = models.DateTimeField(auto_now= True)
   author = models.ForeignKey(User, on_delete= models.CASCADE,related_name='blog_posts')
   created_on = models.DateTimeField(auto_now_add=True)
   status = models.IntegerField(choices=STATUS, default=0)
 
class Meta:
      ordering = ['-created_on']
 
def __unicode__(self):
       return '%s' % self.title

