SELECT
  ack_by AS responder,
  COUNT(*) AS alert_count
FROM alert_events
WHERE ack_by IS NOT NULL
GROUP BY ack_by

UNION

SELECT
  'unassigned' AS responder,
  COUNT(*) AS alert_count
FROM alert_events
WHERE ack_by IS NULL
GROUP BY ack_by;
