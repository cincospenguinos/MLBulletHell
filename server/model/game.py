# game.py
# A single played game, with the various stats and things that are included
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Double, Boolean

Base = declarative_base()

class Game(Base):
	_tablename_ = 'games'

	id = Column(Integer, primary_key = True)
