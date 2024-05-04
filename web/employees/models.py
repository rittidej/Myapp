from positions.models import Positions
from django.db import models

SEX_CHOICES = [
    ('m', 'Male'),
    ('f', 'Famale')
]

class Employees(models.Model):
    avatar_image = models.ImageField(blank=True, upload_to='avatar_image/')
    name = models.CharField(max_length=255)
    address = models.TextField()
    sex = models.CharField(max_length=1, choices=SEX_CHOICES)
    salary = models.DecimalField(max_digits=8, decimal_places=2, default=0.0)
    positions = models.ForeignKey(
        Positions,
        on_delete=models.DO_NOTHING,
        related_name='employees'
    )
    date_of_birth = models.DateField()
    is_resign = models.BooleanField(default=False)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.name

    class Meta:
        db_table = 'employees'