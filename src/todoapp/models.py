from __future__ import unicode_literals

from django.db import models


# Create your models here.
class Todo(models.Model):
    text = models.TextField(max_length=200)
    done = models.BooleanField(default=False)

    def __str__(self):
        return '%s' % self.text
