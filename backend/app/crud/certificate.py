from sqlalchemy.orm import Session
from ..models import Certificate
from ..schemas.certificate import CertificateCreate

def get_certificate(db: Session, certificate_id: int):
    return db.query(Certificate).filter(Certificate.id == certificate_id).first()

def get_certificates_by_user(db: Session, user_id: int):
    return db.query(Certificate).filter(Certificate.user_id == user_id).all()

def create_certificate(db: Session, certificate: CertificateCreate, file_path: str = None):
    db_certificate = Certificate(name=certificate.name, user_id=certificate.user_id, file_path=file_path)
    db.add(db_certificate)
    db.commit()
    db.refresh(db_certificate)
    return db_certificate

