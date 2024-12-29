from loguru import logger
import sys
from rich.console import Console
from rich.theme import Theme
from pathlib import Path


def create_rich_console() -> Console:
    """Create a Rich console with a custom theme."""
    custom_theme = Theme({
        "info": "green",
        "warning": "yellow",
        "error": "bold red",
    })
    return Console(theme=custom_theme)


def configure_logger(log_path: str = "logs/python-template.log") -> None:
    """Configure the Loguru logger with a console handler and a rotating file handler.

    Args:
        log_path (str): Path for the rotating log file.
    """
    # Ensure log directory exists
    log_dir = Path(log_path).parent
    log_dir.mkdir(parents=True, exist_ok=True)

    # Remove default Loguru handler
    logger.remove()

    # Add console handler
    logger.add(
        sys.stdout,
        colorize=True,
    )

    # Add rotating file handler
    logger.add(
        log_path,
        rotation="1 MB",
        retention=5,
        backtrace=True,
        diagnose=True
    )


console = create_rich_console()
configure_logger()
