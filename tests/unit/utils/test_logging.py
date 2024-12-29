import pytest
from loguru import logger
from python_template.utils.logging import configure_logger


def test_log_file_creation(tmp_path):
    """Test if the log file is created."""
    log_file = tmp_path / "test_logs/test.log"
    configure_logger(str(log_file))
    logger.info("This is a test log entry.")
    assert log_file.exists()
    assert log_file.is_file()


def test_console_logging(capfd):
    """Test if console logging outputs correctly."""
    configure_logger()
    logger.info("This is a console test log entry.")

    captured = capfd.readouterr()
    assert "This is a console test log entry." in captured.out


@pytest.fixture
def setup_log_environment(tmp_path):
    """Set up a temporary log environment."""
    log_file = tmp_path / "logs/test.log"
    configure_logger(str(log_file))
    return log_file
