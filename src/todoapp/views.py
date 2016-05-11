from django.views.generic.base import TemplateView
from rest_framework import viewsets
from serializers import TodoSerializer
from models import Todo
import json


# Create your views here.
class TodoView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, *args, **kwargs):
        context = super(TodoView, self).get_context_data(**kwargs)
        todos = [{'todo': todo.text}
                for todo in Todo.objects.all()]
        context['todos'] = json.dumps(todos)
        return context


class TodoViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer
