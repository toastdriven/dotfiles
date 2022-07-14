function dc --wraps='docker compose' --description 'alias d-c="docker compose"'
  docker compose $argv;
end
