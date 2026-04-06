from pydantic import BaseModel
from typing import List
from datetime import datetime

class User(BaseModel):
    name: str
    email: str
    password: str

class Record(BaseModel):
    user_id: str
    title: str          # Added to support frontend RecordTile
    date: str           # Added to support frontend RecordTile (e.g., "2023-10-25")
    diseases: List[str]
    medications: List[str]
    allergies: List[str]