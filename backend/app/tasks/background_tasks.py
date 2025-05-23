from ..services.email_service import send_email
from celery import Celery
from ..config.settings import settings

celery_app = Celery(
    "tasks",
    broker=settings.redis_url,
    backend=settings.redis_url
)

@celery_app.task
def send_welcome_email(email: str):
    send_email(email, "Welcome!", "Thank you for registering.")

@celery_app.task
def process_certificate(certificate_id: int):
    # Placeholder for certificate processing logic
    pass

