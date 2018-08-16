


SELECT
  OpsDate,
  row_id AS RowID,
  workorder_id AS OrderNumber,
  CONVERT(numeric(4, 0), operation) AS OpSeq,
  start AS StartDT,
  CASE
    WHEN s.stop IS NULL THEN GETDATE()
    ELSE s.stop
  END AS StopDT,
  requested_quantity AS ReqQTY,
  quantity AS QTY,
  employee_id AS EmployeeID,
  workcenter AS WorkCenter,
  crew_size AS Crew,
  workorder_part AS Part,
  stop_reason as Reason,
  stop_comment as Comment
FROM finance.dbo.Seamless AS s
WHERE (OpsDate >= '2018-01-01')
AND (DATEDIFF(SECOND, start, stop) > 10) --to eliminate a LOT of useless records
and workcenter is not null