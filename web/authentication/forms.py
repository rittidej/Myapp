from django import forms

class AuthenticationForm(forms.Form):
    username = forms.CharField(max_length=255, widget=forms.TextInput(attrs={'required': 'true', 'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'required': 'true', 'class': 'form-control'}))