
sub get_leads {

    my @not = qw/IL
		 KA
		 MT
		 ND
		 SD
		 OR
		 CT
		 AK
		 VT
		 WI
		 WA
		 WY
		 MA
		 NC
		 ME
		 MN
		 /;

    my $dtsc = DateTime::Span::Common->new;

    my @span = $dtsc->yesterday->datetimes;
    my ($start, $finish) = map { $_->strftime('%F %H:%M:%S') } @span;

    my @query = 
      (
       'SELECT * FROM lead_health LH INNER JOIN lead_master LM USING (lead_id)
WHERE 
   received BETWEEN', \$start, ' AND ', \$finish, 
   ' AND LM.state NOT in ', \@not
      );


    $ds->iquery(@query)->hashes;

}

=for comment

SELECT 
  * 
FROM 
  lead_health LH INNER JOIN lead_master LM USING (lead_id)
WHERE
  received ;; BETWEEN \@boundaries ;;
  AND LM.state NOT ;; IN \@not ;;


=cut
