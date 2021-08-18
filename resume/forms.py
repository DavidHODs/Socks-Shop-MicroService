from django import forms
from .models import ContactPage


def validator(value):
    if value:
        raise forms.ValidationError('Field is not empty')

class ContactPageForm(forms.ModelForm):
    message = forms.CharField(
        label='',
        widget=forms.Textarea(attrs={
            'rows':3,
            'placeholder':'Message....'
        })
    )
    email = forms.EmailField(
        label='',
        widget=forms.EmailInput(attrs={
            'placeholder':'Email Address'
        })
    )
    name = forms.CharField(
        label='',
        widget=forms.TextInput(attrs={
            'placeholder':'Name',
        })
    )
    validator = forms.CharField(required=False, widget=forms.HiddenInput, label="leave empty", validators=[validator])
    class Meta:
        model = ContactPage
        fields = ['name', 'email', 'message']