Function yarnclean {
  Remove-Item ((yarn cache dir) + '\*') -Force -Recurse -ErrorAction ignore;
  Regen-Lockfile;
}

Function regenlockfile {
	Remove-Item -Recurse -Force .\node_modules -ErrorAction ignore;
	Remove-Item -Force .\yarn.lock -ErrorAction ignore;
	yarn install
}