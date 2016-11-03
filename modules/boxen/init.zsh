#
# Setup Boxen correctly
#
# Authors:
#   Josh Chaitin-Pollak <josh@offthehill.org>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

source /opt/boxen/env.sh
