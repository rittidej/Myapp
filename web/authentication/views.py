from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect, render
from .forms import AuthenticationForm
from django.conf import settings
from django.contrib.auth.decorators import user_passes_test
from django.contrib import messages


def user_not_authenticated(user):
    return not user.is_authenticated


@user_passes_test(user_not_authenticated, login_url='/employees')
def index(request):
    form = AuthenticationForm()
    return render(request, 'authentication/index.html', {'form': form})


def signin(request):
    if request.method == 'POST':
        form = AuthenticationForm(request.POST or None)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('/')
            else:
                messages.error(request, settings.LOGIN_ERROR_MESSAGE)
        else:
            messages.error(request, form.errors)
        return render(request, 'authentication/index.html', {'form': form})
    
    return redirect('authentication:index')
    

def signout(request):
    logout(request)
    return redirect('authentication:index')