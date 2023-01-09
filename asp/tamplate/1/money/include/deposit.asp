<!-- TEXT -->
<p class="text-box text-center py-3 px-2 mb-4">
    ※※※※ 입금 전 코인 거래 계좌확인 필수!! ※※※※<br>
    - 카카오페이, 토스, 핀크, 위비모바일페이, 페이코, 뱅크월렛, 하나N월렛, 케이뱅크(퀵송금) 오픈뱅킹(간편송금)은행 대행 업체 이용 불가 (금지)<br>
    - 타행, 타명의 입금 처리 불가, 수표 입금 시, 절대 처리 및 반송 불가<br>
    - 미등록 계좌 입금 시 이체증 확인 후 반환 (반환 소요시간 3시간 ~ 8시간)<br>
</p>
<!-- //TEXT -->

<!-- FORM -->
<form name="depositFrm" id="depositFrm" method="POST">
    <input type="hidden" name="mode" value="deposit">
    <div class="table-box">
        <table class="table-style1">
            <colgroup>
                <col width="15%">
                <col>
            </colgroup>
            <tr>
                <th>보유머니</th>
                <td>
                    <input type="text" name="myMoney" class="form-control u-money" readonly>
                </td>
            </tr>
            <tr>
                <th>입금신청 금액</th>
                <td>
                    <input type="text" class="form-control request-money" name="requestMoney" value="0" readonly>
                    <div class="moeny-btn-box mt-2">
                        <button type="button" class="btn-outline-danger btn" value="10000" onclick="addMoney1(10000);">1만원</button>
                        <button type="button" class="btn-outline-danger btn" value="50000"  onclick="addMoney1(50000);"> 5만원</button>
                        <button type="button" class="btn-outline-danger btn" value="100000"  onclick="addMoney1(100000);">10만원</button>
                        <button type="button" class="btn-outline-danger btn" value="500000"  onclick="addMoney1(500000);">50만원</button>
                        <button type="button" class="btn-outline-danger btn" value="1000000"  onclick="addMoney1(1000000);">100만원</button>
                        <button type="button" class="btn-outline-danger btn" onclick="resetMoney1();">Clear</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th>입금자명</th>
                <td><input type="text" class="form-control" readonly value="홍길동"></td>
            </tr>
        </table>
    </div>
    <p class="text-box text-center py-3 px-2 mt-5">
        23:30~00:30, 휴일 다음 첫 영업일 새벽에는 은행점검으로 인해 계좌이체가 지연 될 수 있습니다.<br>
        위 시간 이외에도 몇몇 은행은 추가적 점검시간이 따로 있으니 이점 유념하시기 바랍니다.
    </p>
    <div class="btn-box text-center mt-4">
        <button type="button" class="btn-dark btn" onclick="deposit();">입금신청</button>
    </div>
</form>
<!-- //FORM -->

<!-- LIST -->
<div class="table-box mt-5">
    <table class="table-style2">
        <colgroup>
            <col width="22%">
            <col width="18%">
            <col width="24%">
            <col width="20%">
            <col width="16%">
        </colgroup>
        <thead>
            <tr>
                <th>입금금액</th>
                <th>입금명</th>
                <th>입금일자</th>
                <th>상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#000">처리완료</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#d01b30">취소</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
            <tr>
                <td>100,000원</td>
                <td>홍길동</td>
                <td>2022-11-05 5:08:27</td>
                <td style="color:#3f51b5">처리중</td>
                <td><a href="#" class="btn-delete">삭제</a></td>
            </tr>
        </tbody>
    </table>
    <div class="btn-box text-center py-4">
        <button type="button" class="btn-light btn btn-sm" value="500000">더보기</button>
    </div>
</div>
<!-- //LIST -->