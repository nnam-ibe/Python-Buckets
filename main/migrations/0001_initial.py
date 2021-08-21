# Generated by Django 3.2.6 on 2021-08-21 08:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Bucket',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('amount_saved', models.DecimalField(decimal_places=2, max_digits=9)),
            ],
        ),
        migrations.CreateModel(
            name='Goals',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('goal', models.DecimalField(decimal_places=2, max_digits=9)),
                ('auto_update', models.BooleanField(default=True)),
                ('contrib_amount', models.DecimalField(decimal_places=2, max_digits=9)),
                ('contrib_frequeny', models.CharField(choices=[('SEMI_MONTHLY', 'Semi Monthly'), ('MONTHLY', 'Monthly'), ('BI_WEEKLY', 'Bi-Weekly'), ('WEEKLY', 'Weekly'), ('NA', 'N/A')], default='MONTHLY', max_length=32)),
                ('bucket_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.bucket')),
            ],
        ),
    ]
