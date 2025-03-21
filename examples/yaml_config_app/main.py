import logging
import logging.config
import yaml

with open('logging.yaml', 'r') as f:
    config = yaml.safe_load(f.read())
    logging.config.dictConfig(config)

logger = logging.getLogger(__name__)

logger.debug('Unuseful message in production')
logger.info('This is an info message')
logger.warning('This is a warning')
logger.error('This is an error')
