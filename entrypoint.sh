#! /bin/env bash
MIX_ENV=prod mix phx.digest
MIX_ENV=prod mix release
./_build/prod/rel/magpie/bin/magpie eval 'Magpie.ReleaseTasks.db_migrate()' || true
./_build/prod/rel/magpie/bin/magpie eval 'Magpie.ReleaseTasks.db_migrate()'
./_build/prod/rel/magpie/bin/magpie start
