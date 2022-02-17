ALTER TABLE `hrnx_status` DROP COLUMN `status_id` , CHANGE COLUMN `status_short` `status_short` VARCHAR(45) NOT NULL  
, DROP PRIMARY KEY 
, ADD PRIMARY KEY (`status_short`) ;

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'passthru', 'Pass-Through Transaction', 'Non-interactive, pass-through transaction'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'preload', 'Pre-loading HRNX Widget', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'pending', 'Pending submission to HRNX', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'submitted_to_hrnx', 'Submitted to HRNX', 'HRNX has accepted the request and will route to vendor(s) for fulfillment.'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'waiting_for_cp', 'Pending Candidate Review', NULL
);


INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'waiting_for_cp_review', 'ACTION NEEDED: Please Review Candidate Response', 'The candidate has reviewed and submitted your request. Fulfillment will begin once you accept or reject the changes.'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'submitted', 'Submitted to Vendor(s)', 'The request has been submitted to your vendor(s) for processing.'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'submitted_passthru', 'Submitted to Vendor(s) via Pass-Through', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
 'accepted', 'Accepted by Vendor(s)', 'The request has been by your vendor(s) with a confirmed receipt of acceptance.'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'rejected_w_errors', 'Rejected with Error(s)', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
 'processing', 'In Progress', 'The request is being processed by your vendor(s).'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'completed_partial', 'Vendor response received', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
 'completed', 'Completed', 'The request has been fulfilled by your vendor(s).'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
 'completed_w_errors', 'ATTN NEEDED: Transaction error has occured', 'Please check with your service provider for transaction details.'
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'completed_w_errors2', 'Please Review (Error Found)', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'canceled', 'Canceled', NULL
);

INSERT INTO `hrnx_status`
(`status_short`,
`status_text`,
`status_diz`)
VALUES
(
'max_attempts_reached', 'Max Attempts Reached', 'Retried max times but failed to transmit'
);
