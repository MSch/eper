.PHONY : changelog

all:
	./rebar compile escriptize

clean:
	./rebar clean

eunit:
	./rebar eunit

changelog:
#       sed -i "s/0.73/0.74/" src/eper.app.src
#       git add src/eper.app.src
#       git commit -m"v0.74"
	git log --name-only --no-merges \
	  | grep -Ev "^[ ]+$$|git-svn-id" > ChangeLog
	echo " Mats Cronqvist <masse@cronqvi.st>" > AUTHORS
	git log | grep Author | grep -Evi "vagrant|no author|mats cronqvist" \
	  | sort -u | cut -c8- >> AUTHORS
#	git add ChangeLog AUTHORS
#	git commit --amend --reuse-message HEAD
#       git tag -a -m"0.74"
#       git push --tags
