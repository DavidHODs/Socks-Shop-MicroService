from django.shortcuts import render, redirect
from django.views import View
from .forms import ContactPageForm
from django.core.mail import send_mail, BadHeaderError
from django.http import HttpResponse
from django.conf import settings
from django.contrib import messages

# Create your views here.
class ResumeView(View):
    def get(self, request, *args, **kwargs):
        form = ContactPageForm()
        context = {
            'form':form
        }
        return render(request, 'resume/index.html', context)

    def post(self, request, *args, **kwargs):
        form =  ContactPageForm(request.POST)

        if form.is_valid():
            subject = f"Message from {form.cleaned_data['name']}"
            message = f"{form.cleaned_data['message']}.\n\nEmail: {form.cleaned_data['email']}"
            sender = settings.EMAIL_HOST_USER
            recipient = [settings.EMAIL_RECIPIENT]

            try:
                send_mail(subject, message, sender, recipient, fail_silently=True)

            except BadHeaderError:
                return HttpResponse('Invalid Header Found')

            # return HttpResponse(f"Message received {form.cleaned_data['name']}. I'll get back to you in a short while.")

            messages.success(request, f"Message received {form.cleaned_data['name']}. I'll get back to you in a short while." )

            
            contact = form.save()

            return redirect('resume:resume')
        else:
            messages.error(request, "Error. Message not sent.")
            return redirect('resume:resume')

