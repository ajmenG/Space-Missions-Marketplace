from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from ..schemas import mission as mission_schema
from ..crud import mission as mission_crud
from ..dependencies.auth import get_current_user, get_current_active_admin, get_db

router = APIRouter(
    prefix="/missions",
    tags=["missions"],
)

@router.post("/", response_model=mission_schema.Mission, dependencies=[Depends(get_current_active_admin)])
def create_mission(mission: mission_schema.MissionCreate, db: Session = Depends(get_db)):
    return mission_crud.create_mission(db=db, mission=mission)

@router.get("/{mission_id}", response_model=mission_schema.Mission)
def read_mission(mission_id: int, db: Session = Depends(get_db)):
    db_mission = mission_crud.get_mission(db=db, mission_id=mission_id)
    if db_mission is None:
        raise HTTPException(status_code=404, detail="Mission not found")
    return db_mission

@router.get("/", response_model=List[mission_schema.Mission])
def read_missions(skip: int = 0, limit: int = 100, search: Optional[str] = Query(None), db: Session = Depends(get_db)):
    missions = mission_crud.get_missions(db, skip=skip, limit=limit, search=search)
    return missions

@router.patch("/{mission_id}", response_model=mission_schema.Mission, dependencies=[Depends(get_current_active_admin)])
def update_mission(mission_id: int, available: bool, db: Session = Depends(get_db)):
    db_mission = mission_crud.update_mission_availability(db=db, mission_id=mission_id, available=available)
    if db_mission is None:
        raise HTTPException(status_code=404, detail="Mission not found")
    return db_mission

