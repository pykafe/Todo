from django.views.generic.base import TemplateView
from models import Todo
from rest_framework import viewsets
from todoapp.serializers import TodoSerializer


class TodoViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer


class TodoView(TemplateView):
    template_name = 'index.html'
