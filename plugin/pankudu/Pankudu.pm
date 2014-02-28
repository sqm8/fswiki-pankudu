package plugin::pankudu::Pankudu;
# <p>�ѥ󤯤��ꥹ�Ȥ�ɽ�����ޤ���</p>
# <p>
#   ���ץ����Ȥ��ơ������˥ڡ���̾�ȥꥹ�ȶ��ڤ��ʸ�������Ǥ��ޤ���
# </p>
# <pre>
# {{pankudu[ hogehoge/blabla[, ��]]}}
# </pre>
# <pre>
# [[hogehoge]] �� [[blabla|hogehoge/blabla]]
# </pre>
# <p>�ڡ���̾��/(����å���)�Ƕ��ڤä���Τ򡢿ƥڡ����ȸ��ʤ��ޤ���</p>
# <p>��3�����ʹߤ˥ڡ���̾��Ϳ����ȡ�Ǥ�դΥڡ������ؤȤ��ƻȤ��ޤ���</p>
# <pre>
# {{pankudu hogehoge/blabla, ��, foo, bar, baz}}
# </pre>
# <pre>
# [[foo]] �� [[bar]] �� [[baz]] �� [[blabla|hogehoge/blabla]]
# </pre>

# $Id: Pankudu.pm,v 1.1.1.1 2006/03/17 18:35:26 sakuma Exp $
#
# Copyright 2005-2009 BitCoffee, Inc. All rights reserved.
# Copyright (C) medicalsystems, Inc.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the name of the nor the names of its contributors may be used to
#   endorse or promote products derived from this software without specific
#   prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

use strict;
use lib "./lib";


# /**
#  * Constructor
#  * @author Hiro Sakuma <sakuma@zero52.com>
#  * @return $self
#  */

sub new {

	my $class = shift;
	my $self = {};

	return bless $self, $class;

}


# /*
#  * inline
#  * @author Hiro Sakuma <sakuma@zero52.com>
#  * @param $wiki
#  * @param $page
#  * @param $delimiter
#  * @param @pages
#  * @return $str
#  */

sub inline {

	my $self = shift;
	my $wiki = shift;
	my $page = shift;
	my $delimiter = shift || " �� ";
	my @pages = @_;
	my $cgi = $wiki->get_CGI();
	my ($pagename, $p, $l);
	my (@pankudu);

	$pagename = $page || $cgi->param("page");

	if (!$wiki->can_show($pagename)) {
		return;
	}


	if (@pages) {

		foreach (@pages, $pagename) {

			$l = $_;
			$p = $l;

			## �ڡ���̾���ڤ�Ф�
			$p =~ s/^.*?([^\/]+)$/$1/;

			## �ѥ󤯤�
			push(@pankudu, "[[" . $p . "|" . $l . "]]");

		}

	} else {

		foreach (split("/", $pagename)) {

			## �ڡ���̾
			$p = $_;

			## ���
			if (defined($l)) {
				$l .= "/" . $p;
			} else {
				$l = $p;
			}

			## �ѥ󤯤�
			push(@pankudu, "[[" . $p . "|" . $l . "]]");

		}

	}

	return join($delimiter, @pankudu);

}


1;
