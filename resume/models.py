from django.db import models
from django.utils import timezone

# Create your models here.
class ContactPage(models.Model):
    name = models.CharField(max_length=80, blank=False)
    email = models.EmailField(blank=False)
    message = models.TextField(blank=False)
    created_on = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.name