from email import contentmanager
from django.shortcuts import render, get_object_or_404, redirect
from .forms import PositionsForm
from .models import Positions
from django.contrib import messages
from django.conf import settings
from django.contrib.auth.decorators import login_required


@login_required
def index(request):
    positions = Positions.objects.all()
    form = PositionsForm()
    context = {
        'form': form,
        'positions': positions,
    }
    return render(request, 'positions/index.html', context)


@login_required
def create(request):
    form = PositionsForm()
    context = {
        'form': form,
    }    
    return render(request, 'positions/create.html', context)


@login_required
def store(request):
    if request.method == 'POST':
        try:
            form = PositionsForm(request.POST or None)
            context = {
                'form': form,
            }
            if form.is_valid():
                form.save()
                messages.success(request, settings.SAVE_SUCCESS)
            else:
                messages.error(request, form.errors)
                return render(request, 'positions/create.html', context)
        except:
            messages.error(request, settings.SAVE_ERROR)
            
    return redirect('positions:index') 


@login_required
def edit(request, id):
    position = get_object_or_404(Positions, id=id)
    form = PositionsForm(instance=position)
    context = {
        'form': form,
        'position': position,
    }
    return render(request, 'positions/edit.html', context)


@login_required
def update(request, id):
    if request.method == 'POST':
        try:
            position = get_object_or_404(Positions, id=id)
            form = PositionsForm(request.POST or None, instance=position)
            context = {
                'form': form,
                'position': position
            }
            if form.is_valid():
                form.save()
                messages.success(request, settings.SAVE_SUCCESS)
            else:
                messages.error(request, form.errors)
        except:
            messages.error(request, settings.SAVE_ERROR)
        return redirect('positions:edit', id)

    return redirect('positions:index')


@login_required
def delete(request, id):
    if request.method == 'POST':
        try:
            position = get_object_or_404(Positions, id=id)
            position.delete()
            messages.success(request, settings.SAVE_SUCCESS)
        except:
            messages.error(request, settings.SAVE_ERROR)

    return redirect('positions:index')