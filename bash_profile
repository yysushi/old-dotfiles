if [ -f /etc/profile ]; then
  PATH=
  source /etc/profile
fi

. $HOME/.bashrc
