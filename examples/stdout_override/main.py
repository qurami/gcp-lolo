from gcp_lolo import setup_gcp_logging
from dotenv import load_dotenv

load_dotenv()

setup_gcp_logging('my-test-app')

print('This is a test message')

raise Exception('This is a test exception')
