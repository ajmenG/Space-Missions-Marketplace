from sqlalchemy.orm import Session
from ..models import Mission
from ..schemas.mission import MissionCreate

def get_mission(db: Session, mission_id: int):
    return db.query(Mission).filter(Mission.id == mission_id).first()

def get_missions(db: Session, skip: int = 0, limit: int = 100, search: str = None):
    query = db.query(Mission)
    if search:
        query = query.filter(Mission.name.contains(search))
    return query.offset(skip).limit(limit).all()

def create_mission(db: Session, mission: MissionCreate):
    db_mission = Mission(
        name=mission.name,
        description=mission.description,
        required_certificates=mission.required_certificates,
        available=mission.available
    )
    db.add(db_mission)
    db.commit()
    db.refresh(db_mission)
    return db_mission

def update_mission_availability(db: Session, mission_id: int, available: bool):
    mission = get_mission(db, mission_id)
    if mission:
        mission.available = available
        db.commit()
        db.refresh(mission)
    return mission

