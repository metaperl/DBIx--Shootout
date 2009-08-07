sub get_people {
    my ($email) = @_;

    my ($pid) =
        $ds->iquery("SELECT p.id"
                    ." FROM people AS p"
                    ."  INNER JOIN email AS e ON p.id=e.people_id"
                    ." WHERE ",
                    {
                        email_type => 3,
                        email => $email,
                    })->list;
    return $pid;
}

=for comment

SELECT
  p.id
FROM
 people p INNER JOIN email E ON p.id=e.peopleID
;;
  WHERE { email_type => 3, email => $email } 
;;


=cut
