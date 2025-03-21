import logging
from logging.config import fileConfig

fileConfig('logging.ini')
logger = logging.getLogger(__name__)

logger.debug('Unuseful message in production')
logger.info('This is an info message')
logger.warning('This is a warning')
logger.error('This is an error')
