from django import forms
from .models import Employees

class EmployeesForm(forms.ModelForm):
    class Meta:
        model = Employees
        exclude = ['created', 'updated']
        widgets = {
            'date_of_birth': forms.DateInput(attrs={'type': 'date'})
        }