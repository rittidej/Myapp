# Generated by Django 4.2.1 on 2023-05-18 12:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='employees',
            old_name='position',
            new_name='positions',
        ),
    ]