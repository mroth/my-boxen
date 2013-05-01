# This file will be loaded by config/basic early in a Boxen run. Use
# it to provide any custom code or behavior your Boxen setup requires.

# Change the prefix boxen is installed to.
# ENV['BOXEN_HOME'] = '/opt/boxen'

# Change the repo boxen will use.
ENV['BOXEN_REPO_NAME'] = 'mroth/my-boxen'

# Boxen binary packaging
# ENV["BOXEN_S3_ACCESS_KEY"] = ''
# ENV["BOXEN_S3_SECRET_KEY"] = ''
# ENV["BOXEN_S3_BUCKET"] = ''

# Auto-report issues on failed runs
# ENV["BOXEN_ISSUES_ENABLED"] = 'yes'

# Submit audit data to an arbitrary HTTP endpoint
# ENV["BOXEN_WEB_HOOK_URL"] = 'https://some-uri.com/boxen'

# Uncomment me to not use precompiled binaries for ruby-build
#   - see https://github.com/boxen/puppet-ruby/commit/8703128ffa4153f8a1681f9077a13672ab7845f8
# ENV["SKIP_PRECOMPILED_RUBIES"] = true
