from django.shortcuts import render, get_object_or_404, redirect
from .models import Employees
from .forms import EmployeesForm
from django.contrib import messages
from django.conf import settings
from django.contrib.auth.decorators import login_required


@login_required
def index(request):
    employees = Employees.objects.select_related('positions')
    form = EmployeesForm()
    context = {
        'form': form,
        'employees': employees,
    }
    return render(request, 'employees/index.html', context)


@login_required
def create(request):
    form = EmployeesForm()
    context = {
        'form': form,
    }    
    return render(request, 'employees/create.html', context)


@login_required
def store(request):
    if request.method == 'POST':
        try:
            form = EmployeesForm(request.POST or None, request.FILES or None)
            context = {
                'form': form,
            }
            if form.is_valid():
                form.save()
                messages.success(request, settings.SAVE_SUCCESS)
            else:
                messages.error(request, form.errors)
                return render(request, 'employees/create.html', context)
        except:
            messages.error(request, settings.SAVE_ERROR)
            
    return redirect('employees:index') 


@login_required
def edit(request, id):
    employee = get_object_or_404(Employees, id=id)
    form = EmployeesForm(instance=employee)
    context = {
        'form': form,
        'employee': employee,
    }
    return render(request, 'employees/edit.html', context)


@login_required
def update(request, id):
    if request.method == 'POST':
        try:
            employee = get_object_or_404(Employees, id=id)
            form = EmployeesForm(request.POST or None, request.FILES or None, instance=employee)
            if form.is_valid():
                form.save()
                messages.success(request, settings.SAVE_SUCCESS)
            else:
                messages.error(request, form.errors)
        except:
            messages.error(request, settings.SAVE_ERROR)
        return redirect('employees:edit', id)

    return redirect('employees:index')


@login_required
def delete(request, id):
    if request.method == 'POST':
        try:
            employee = get_object_or_404(Employees, id=id)
            employee.delete()
            messages.success(request, settings.SAVE_SUCCESS)
        except:
            messages.error(request, settings.SAVE_ERROR)

    return redirect('employees:index')