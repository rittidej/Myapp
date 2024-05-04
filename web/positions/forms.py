from django import forms
from .models import Positions

class PositionsForm(forms.ModelForm):
    class Meta:
        model = Positions
        fields = ('name',)